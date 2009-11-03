module Typus

  module Format

    protected

    def generate_html

      items_count = @resource[:class].count(:joins => @joins, :conditions => @conditions)
      items_per_page = @resource[:class].typus_options_for(:per_page).to_i

      @pager = ::Paginator.new(items_count, items_per_page) do |offset, per_page|
        data(:limit => per_page, :offset => offset)
      end

      @items = @pager.page(params[:page])

      select_template :index

    end

    def generate_csv

      require 'fastercsv'

      fields = @resource[:class].typus_fields_for(:csv).collect { |i| i.first }
      csv_string = FasterCSV.generate do |csv|
        csv << fields.map { |f| _(f.humanize) }
        data.each { |i| csv << fields.map { |f| i.send(f) } }
      end

      filename = "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{@resource[:self]}.csv"
      send_data(csv_string,
               :type => 'text/csv; charset=utf-8; header=present',
               :filename => filename)

    rescue LoadError
      render :text => _("FasterCSV is not installed.")
    end

    def generate_xml
      fields = @resource[:class].typus_fields_for(:xml).collect { |i| i.first }
      render :xml => data.to_xml(:only => fields)
    end

    def data(*args)
      eager_loading = @resource[:class].reflect_on_all_associations(:belongs_to).map { |i| i.name }
      options = { :joins => @joins, :conditions => @conditions, :order => @order, :include => eager_loading }
      options.merge!(args.extract_options!)
      @resource[:class].find(:all, options)
    end

  end

end