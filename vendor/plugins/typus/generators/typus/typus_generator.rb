require 'ftools'

class TypusGenerator < Rails::Generator::Base

  def manifest

    record do |m|

      # Default name for our application.
      application = Rails.root.basename

      # To create <tt>application.yml</tt> and <tt>application_roles.yml</tt> 
      # detect available AR models on the application.
      models = Dir['app/models/*.rb'].collect { |x| File.basename(x).sub(/\.rb$/,'').camelize }
      @ar_models = []

      models.each do |model|
        begin
          klass = model.constantize
          active_record_model = klass.superclass.equal?(ActiveRecord::Base) && !klass.abstract_class?
          active_record_model_with_sti = klass.superclass.superclass.equal?(ActiveRecord::Base)
          @ar_models << klass if active_record_model || active_record_model_with_sti
        rescue Exception => error
          puts "=> [typus] #{error.message} on '#{model.class.name}'."
          exit
        end
      end

      # Configuration files
      config_folder = Typus::Configuration.options[:config_folder]
      Dir.mkdir(config_folder) unless File.directory?(config_folder)

      configuration = { :base => '', :roles => '' }

      @ar_models.sort{ |x,y| x.class_name <=> y.class_name }.each do |model|

        # Detect all relationships except polymorphic belongs_to using reflection.
        relationships = [ :belongs_to, :has_and_belongs_to_many, :has_many, :has_one ].map do |relationship|
                          model.reflect_on_all_associations(relationship).reject { |i| i.options[:polymorphic] }.map { |i| i.name.to_s }
                        end.flatten.sort

        # Remove foreign key and polymorphic type attributes
        reject_columns = []
        model.reflect_on_all_associations(:belongs_to).each do |i|
          reject_columns << model.columns_hash[i.name.to_s + '_id']
          reject_columns << model.columns_hash[i.name.to_s + '_type'] if i.options[:polymorphic]
        end

        model_columns = model.columns - reject_columns

        # Don't show `text` fields and timestamps in lists.
        list = model_columns.reject { |c| c.sql_type == 'text' || %w( id created_at updated_at ).include?(c.name) }.map(&:name)
        # Don't show timestamps in forms.
        form = model_columns.reject { |c| %w( id created_at updated_at ).include?(c.name) }.map(&:name)
        # Show all model columns in the show action.
        show = model_columns.map(&:name)

        # We want attributes of belongs_to relationships to be shown in our 
        # field collections if those are not polymorphic.
        [ list, form, show ].each do |fields|
          fields << model.reflect_on_all_associations(:belongs_to).reject { |i| i.options[:polymorphic] }.map { |i| i.name.to_s }
          fields.flatten!
        end

        configuration[:base] << <<-RAW
#{model}:
  fields:
    list: #{list.join(', ')}
    form: #{form.join(', ')}
    show: #{show.join(', ')}
  actions:
    index:
    edit:
  order_by:
  relationships: #{relationships.join(', ')}
  filters:
  search:
  application: #{application}
  description:

        RAW

        configuration[:roles] << <<-RAW
  #{model}: create, read, update, delete
        RAW

      end

      Dir["#{Typus.root}/generators/typus/templates/config/typus/*"].each do |f|
        base = File.basename(f)
        m.template "config/typus/#{base}", "#{config_folder}/#{base}", 
                   :assigns => { :configuration => configuration }
      end

      # Initializer

      [ 'config/initializers/typus.rb' ].each do |initializer|
        m.template initializer, initializer, :assigns => { :application => application }
      end

      # Assets

      [ 'public/stylesheets/admin', 
        'public/javascripts/admin', 
        'public/images/admin', 
        'public/images/admin/fancybox' ].each { |f| Dir.mkdir(f) unless File.directory?(f) }

      [ 'public/stylesheets/admin/screen.css', 
        'public/stylesheets/admin/reset.css', 
        'public/stylesheets/admin/jquery.fancybox.css', 
        'public/images/admin/ui-icons.png' ].each { |f| m.file f, f }

      %w( application jquery-1.3.2.min jquery.fancybox-1.2.1.min ).each do |f|
        file = "public/javascripts/admin/#{f}.js"
        m.file file, file
      end

      %w( closebox left progress right shadow_e shadow_n shadow_ne shadow_nw shadow_s shadow_se shadow_sw shadow_w title_left title_main title_right ).each do |image|
        file = "public/images/admin/fancybox/fancy_#{image}.png"
        m.file file, file
      end

      %w( app/views/admin app/controllers/admin test/functional/admin ).each do |folder|
        FileUtils.mkdir_p(folder) unless File.directory?(folder)
      end

      ##
      # Generate:
      #   `app/controllers/admin/#{resource}_controller.rb`
      #   `test/functional/admin/#{resource}_controller_test.rb`
      #
      Typus.models.each do |model|

        m.template "auto/resources_controller.rb.erb", 
                   "app/controllers/admin/#{model.tableize}_controller.rb", 
                   :assigns => { :model => model }

        m.template "auto/resource_controller_test.rb.erb", 
                   "test/functional/admin/#{model.tableize}_controller_test.rb", 
                   :assigns => { :model => model }

      end

      ##
      # Generate controllers for tableless models.
      #
      Typus.resources.each do |resource|

        m.template "auto/resource_controller.rb.erb", 
                   "app/controllers/admin/#{resource.underscore}_controller.rb", 
                   :assigns => { :resource => resource }

        views_folder = "app/views/admin/#{resource.underscore}"
        FileUtils.mkdir_p(views_folder) unless File.directory?(views_folder)
        m.file "auto/index.html.erb", "#{views_folder}/index.html.erb"

      end

      # Migration file

      m.migration_template 'db/create_typus_users.rb', 'db/migrate', 
                            { :migration_file_name => 'create_typus_users' }

    end

  end

end