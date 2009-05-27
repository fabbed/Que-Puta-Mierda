-- MySQL dump 10.11
--
-- Host: localhost    Database: queputamierda
-- ------------------------------------------------------
-- Server version	5.0.51a-3ubuntu5.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Trabajo',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(2,'Dinero',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(3,'Salud',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(4,'Niños',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(5,'Amor',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(6,'Sexo',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31'),(7,'Otros',NULL,'2009-05-05 21:39:31','2009-05-05 21:39:31');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) default '',
  `comment` varchar(255) default '',
  `created_at` datetime NOT NULL,
  `commentable_id` int(11) NOT NULL default '0',
  `commentable_type` varchar(15) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'','Qué asco, colega!','2009-05-05 21:44:44',2,'Story',2),(2,'','Eso si que es una tienda de mierda.....','2009-05-06 10:48:39',2,'Story',0),(3,'','eso es lo que yo llamo una puta mierda!!!!','2009-05-06 13:23:02',2,'Story',0),(4,'','Y el papel higienico estaba aldentro de la caja tbn?\r\nSeria mas asco aun...','2009-05-06 13:53:53',2,'Story',1),(5,'','Que lindo la historia, aunque no es una \"puta mierda\" ni una \"te lo buscaste\". ','2009-05-07 07:26:25',4,'Story',1),(6,'','Bueno es casi una puta mierda y un casi te lo buscaste, porque al fin y al cabo mi teléfono perdido estuvo todo el tiempo en mi bolsillo...(Se me olvido decir eso?)','2009-05-07 09:33:57',4,'Story',0),(7,'','jajaja Era un detalle importante. Yo lo he deducido pero es que tenía una pista previa.','2009-05-07 09:41:18',4,'Story',0),(8,'','ami me mandaron ala goma por andar kon dos al mismo tienpo y se en te terararon las dos y memandaron ala chin gada\r\n','2009-05-07 21:25:49',5,'Story',0),(9,'','locer crazy','2009-05-08 22:20:00',6,'Story',0),(10,'','sos un voludo no podes  pensar como enamorarla','2009-05-08 22:24:10',7,'Story',5),(11,'','no te entendi nada de lo que escribistes\r\n','2009-05-08 22:26:44',8,'Story',5),(12,'','que mas e cuentas','2009-05-08 22:28:00',8,'Story',5),(13,'','la neta no deberias ir tan rapidamente la vida es larga y a la mayoria de las mujeres nos gusta que nos sintamos queridas y la neta si ellas solo te buscan para pasarla un rato mandalas a la chingada porque no valen la pena...animo ','2009-05-09 01:19:50',8,'Story',0),(14,'','mira la neta debes de asegurarte de si vale la pena porque no te quiebres la cabeza por alguien que no lo merese y si es asi haste su amigo y ganate la confianza y cuando sepas que ella es incapaz de lastimarter lanzatele y asi veras si es un amor corresp','2009-05-09 01:24:54',7,'Story',0),(15,'','no te desanimes solo amigos asi esta bien como poder enamorarla cuando tiene novia no seas menso a nosotras no nos gusta que nos molesten cuando tenemos novio piensalo.......no te entrometas esoera a que terminen.....osino ella se fastidiara de ti........','2009-05-09 01:28:03',7,'Story',0),(16,'','sabes preguntate porque lo amas si es por su fisico estas loca si nadamas quieres usarlo te va a lastimar y si no es asi y no sabes porque te gusta es pura obsesion piensa antes de actuar','2009-05-09 01:30:03',6,'Story',0),(17,'','y que onda contigo amiguito0 que te desaparecs cada vz que quiers sabes? yo te extrañ muchjo pero tu nada que te aparecesa ojola tengas tiepo de respondern\r\nme añgun dia te quiero muchotote A\r\n\r\ntte MAYRA','2009-05-09 07:25:11',10,'Story',0),(18,'','y que onda contigo amiguito0 que te desaparecs cada vz que quiers sabes? yo te extrañ muchjo pero tu nada que te aparecesa ojola tengas tiepo de respondern\r\nme añgun dia te quiero muchotote A\r\n\r\ntte MAYRA','2009-05-09 07:25:12',10,'Story',0),(19,'','','2009-05-09 07:26:48',4,'Story',0),(20,'','no entendo lo que escribiste....sorry...pero es algo komo mas comico que triste ......\r\nbye...suerte','2009-05-09 19:27:42',13,'Story',0),(21,'','','2009-05-10 02:12:23',12,'Story',0),(22,'','la verdad tenes que dejarlo ir por mas que duela mucho yo estoy comenzando una relaciion nueva ii ojala todo salga bien aunq lo hice porq estaba segura de habver olvidado a mi ex','2009-05-10 03:44:46',14,'Story',0),(23,'','umm  tu sufriendo y yo agarrandome de tu cuerda, yo conoci a un tipo en unos dias por internet que idiota soy el me dijo te quiero yo le reclamaba q no se conectara aveces y sentia q no le importaba me borro de su correo y ni una razon me dio estoy bastan','2009-05-11 00:13:09',8,'Story',0),(24,'','jajajajaja que cagada con la limpiadora... pero bueno que se le puede hacer... esa era la suerte de ella... jajajajaja','2009-05-11 03:42:35',2,'Story',8),(25,'','e pasado lo mismo y te comprendo y lo uniko q rt puedo decir es q el timepo es el q va ayudar, es feo cuando no valoran los sentimientos y nadamas juegan con ellos, la vida sigue amigo vivela y superate y no t sierres al amor ni por despecho inicies una r','2009-05-11 05:25:29',14,'Story',7),(26,'','bobo marica a las mujeres no se les ruega','2009-05-11 16:29:58',18,'Story',0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090504140035'),('20090504153451'),('20090504153818'),('20090504154109'),('20090504154415');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `stories` (
  `id` int(11) NOT NULL auto_increment,
  `body` text,
  `email` varchar(255) default NULL,
  `rated_top` int(11) default '0',
  `rated_flop` int(11) default '0',
  `anonymous` tinyint(1) default '1',
  `on_startpage` tinyint(1) default '0',
  `category_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,'Hace como un mes me cogí una papa bien gorda y estaban mis padres en casa así que, para no tener que ir al baño, me puse una bolsa al lado de la cama:S A la mañana siguiente tiré la bolsa por la ventana para que mi hermana la recogiera al salir y la echase en un contenedor. Pero con la mala suerte de que la bolsa de la pota se enganchó en la Bouganvilla de fuera. Horror!! ¡9 de la mañana y las 2 con un palo intentando desengancharla! (Y con resaca!) :D',NULL,6,5,0,0,7,2,'2009-05-05 21:43:19','2009-05-11 00:20:30'),(2,'Trabajo en una tienda de ropa que no tiene aseo. El viernes pasado tuve un retortijón terrible pero, como mi compañero no estaba y había clientes dentro, no podía salir para ir al bar a soltar el lastre… Así que dejé a los que estaban allí a sus anchas y me metí en el almacén a “solucionar el problema”… en una caja de cartón. Hubo tanto lío después que cerré sin acordarme de sacar la prueba del delito. Caí en la cuenta una vez en casa pero cuando llegué el Lunes… ya era tarde. ¡La limpiadora lo había encontrado antes que yo! ',NULL,10,2,1,0,1,2,'2009-05-05 21:44:00','2009-05-09 19:22:11'),(3,'Trabajo en un edificio grande, y estaba la gente de mantenimiento arreglando el ascensor, y se dejaron el carro de las herramientas fuera, se les cerró la puerta y como no me vieron me lleve el carro con las herramientas a la otra punta del edificio, y las envie al sótano por otro ascensor.\r\nY al rato veo a todos los de mantenimiento buscando en oficinas, baños, pasillos a ver donde estaba el carro, les tomo un par de horitas encontrarlo','',0,3,1,0,1,NULL,'2009-05-06 10:56:54','2009-05-06 15:53:40'),(4,'Vivo en un lugar indefinido de Francia, aunque a veces vuelvo al calor de mi Suiza NO natal para algunas curas de tipo médico. La última vez que fui, no hace mucho,la semana pasada diría yo, llegué en coche junto con un hombrecillo de la montaña a un pueblo perdido para buscar una iglesia (sí). En vez de eso encontramos un colegio americano que resultó ser aquel en el que se encontraron los Strokes, esos pijos poperos que tanto me gustan. En fin, que mientras nos contaban esa historia decidimos irnos a Berlin, porque sí, porque tengo a un par de conocidas por alli, pero al llegar a casa los vuelos estaban fuera de nuestro ya pasado de rosca presupuesto. Llamé a mis contactos un par de veces, pero nada, así que ni la ilusión les pude contagiar. Al final acabé en Zurich en una POLIPARTY en la universidad con conciertos, alcohol y mucha diversión. Conocí a unos Suizos muy poco suizos y bailé hasta que el alcohol ingerido decidió salir, después me perdí y perdí el teléfono, el que horas antes no tocó tierra en Berlin, y conocí a una rubia alemana llamada Carmen que me acompañó en mi odisea de saltar escenarios para decir el nombre de mi suizo de las montañas. Acabé mal hablando las lenguas que sé con todo el personal de seguridad del sitio, que no era poco, y por último me monté en un taxi dirección a la estación \"To the railway station, no tengo dinero\" dije. Cuando puse mis temblorosos pies sobre el suelo de la estación me encontré al desaparecido haciendo amigos con cerveza. He vomitado, dije. Él sólo me besó.( La verdad es que me lo pasé muy bien y sólo por lo anecdótico creo que merece la pena, lo escribo aqui no porque crea en su caracter catastrófico es porque a veces le vendo votos a una amiga, una que tengo en Berlin, pero nunca responde al teléfono. Yo tampoco.)','',1,4,1,0,6,NULL,'2009-05-06 20:39:14','2009-05-11 14:34:45'),(5,'Hola me llamo Lary y vivo en un p!n(H3 pueblito bien super aburrido. Estoy super enojada con mi exnovio x k m termino x una estupida razon!!! El dice k soy una super mentirosa y k le jure enbano y k el yano puede confiar en mi. Y k sugun el no puede seguir haci! Pero el noes ningun santico x k el tambien meha mentido mucho y yo no m kejo x k lo kiero un chorro!!!! Pero ahora el dice k esta super arrenpentido y k m extra~a un buen. Pero yo ya no kiero regresar con el x k yo no soy  segundo plato de nadie. Y ahora k su aguante y k se muera de celos!!!!!!! Eso le pasa x super orgulloso!',NULL,2,0,1,0,5,3,'2009-05-07 20:25:18','2009-05-08 02:40:47'),(6,'hola me llamo isa y estoy enamorada de un chavo pero no se si tiene novia pero aunque la tenga lo voy a seguir queriendo porquelo amo  en verdad  el se llama luis  y es una belleza yen verdad lo amo y me gustaria ser su novia en verdad el juega futbol y dica antes mi prima de que yo me fuera a vivir  que el se hiva a jugar alla con los amigos  , ahora va a jugar enfrente de mi casa , y estoy casi segura de que esta enamorado de mi y me gustaria que el me dijiera que fuera su novia lo amo loamo loamooooooooooooooooooooooooooooooo con todo mi corazon y toda mi alma , haria lo que fuera para que me dijiera que esta enamorado de mi lo que fuera lo amo,amo ,amo ,amo y amo enverdad lo amo','',0,0,1,0,5,NULL,'2009-05-08 03:29:55','2009-05-08 03:29:55'),(7,'hola... necesito consejos. estoy enamorado de una chica que tiene novio ...que me aconsejan ustedes?','',2,0,1,0,5,NULL,'2009-05-08 21:36:09','2009-05-11 03:08:31'),(8,'olas a todos...mi problema es ke me enamoro muy rapido..osea ke kuando conosco a alguna chika..siento cosas demasiado intensas demasiado rapido y eso me trae desilusiones y tristesas en mi vida..ya no se ke aser...ademas siempre me tokan mujeres ke solo keren algo corto...y yo estoy en busca del verdadero amor......y en esos momentos estoy pasando por eso...me siento muy mal.....aaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\r\nme siento muy mal..muy triste ..kero puro virarme de todo esto\r\n',NULL,5,0,1,0,5,4,'2009-05-08 21:52:55','2009-05-09 15:47:50'),(9,'{anonimo) ho,lllllllaaaaaaaa[ bueno estoy enamorada de super bonbon  que es muy guapo solo , con dacirte q3 se parece a nick de los jonas brothers { que , looooooocuuuuuuraaaaaaaaaaaaaaaaa , cuando lo vi me enamore de el , pero no se que hacer porq la pienso si tiene novia y eso me entristece ...............auxilio.....................no se que hacer.............',NULL,0,0,1,0,5,5,'2009-05-08 22:36:18','2009-05-08 22:36:18'),(10,'realmente kreo ke aora nunka encontrare a la mujer ideal para mi.......yo suelo kerer muxo a las personas...lo malo es ke solo vasta con estar poko tiempo kon ella para empezar a sentir algo...soy muy debil de sentimientos....alomejor nesecito el cariño de alguien...el amor de verdad.no el de un rato.\r\ny en estos momentos estopy sufriendo muxo...pliss ayudenme...ahh.\r\ny soy de chile...por si es ke alguien mas lo es...\r\n',NULL,1,0,1,0,5,4,'2009-05-08 23:22:18','2009-05-09 16:09:20'),(11,'Estudio en una ciudad diferente a la mia y vivo en un piso de estudiantes, y mi novio es de otra ciudad diferente, así que un verano al principio de estar juntos teniamos muchas ganas de vernos y no era plan ni de irme a su casa con sus padres ni a la mia claroo, así que decidimos vernos en la ciudad en la estudiamos, en verano no teniamos al quilado el piso pero íbamos a volver en septiembre y yo tenía las llaves, así que decidimos irnos a mi piso dos diitas, hacía tanto calor que tuvimos que trasladar el colchon al salon porque era la única habitación de la casa con aire acondicionado, así que después de toda la pasión y todo el calor que hacia nos quedamos dormidos en bolas ya la mañana siguienteee wualaaa nos desperto el caserooo que había venido a arreglarr unaaaa lámparaaaaaaa!!! Que vergüenzaa x dioosss!!!!! debería haber cambiado de pisoo después de esto ahora que lo piensoo jajaajajaja','',2,0,1,0,6,NULL,'2009-05-09 17:26:51','2009-05-11 03:30:08'),(12,'Hace ya unos años de esto la cuestión es que fui de camping con unos amigos y estábamos un poco alejados del pueblo o teníamos coche ni mucho dinero así que una noche 3 de los que estábamos decidimos salir de juerga, así que pregúntamos el camino para ir al pueblo y había dos posibilidades o bien por la carretera que se tardaba una hora andando o por la playa andndo que eran 40 minutoss y claro ahorrarsee 20 minutoss andandoo.. así que nos fuimos por la playa llegamos bien sin percances pasamos una gran noche de vicio y perversión jejeje y llegó la hora de volver serían las 6 de la mañana de noche, y ya íbamos demasiado bien, así que empezamos a andar por la playa y cuando llevábamos 25 minutos andandooo nos dimos cuenta de que había subido la mareaa y el agua nos había cortado el pasoo así que o bien dábamos la vuelta o dormíamos allí, cosa que no nos apetecían nadaa asi que ni cortos ni perezososs volvimos nadando a camping jejejeee uventudd divino tesorooo','',0,1,1,0,7,NULL,'2009-05-09 17:36:27','2009-05-10 00:29:43'),(13,'una vez me cogi una papa mu gorda (así podrían empezar muhas historias) y llegué a mi casa me acosté y empezó todo a darme vueltas así que intenté el truco de poner un pie el suelo para q dejara de dar vueltas, pues bien, no funcionó y se m vino todo lo que había venido para arriba vomité al lado de la cama y me decía a mi misma: \"ahora me levanto y lo recojo, ahora me levanto, ahora, ahora\" pero imposible me quedé frita, la cuestión es que la puerta de mi cuarto está a los pies de mi cama, era sábado y mi madre los domingos entra en mi cuarto por la mañana me levanta el edredon y me mete el teléfono inalámbrico en la cama porque si no ya puede llama el santo padre que no me entero, y ese domingo mi madre iaba a ser lo mismo y como habia vomitado al otro lado de la cama mi madre no tenía porque verlo pero craso error, porque ese dia descubrí que mi casa está en cuesta y rodó todo hasta la puertaa cuando entro mi madre me dijo: \"niñaaaaaa que has vomitadooo?? no veaaass ayerrr no?\" a lo que yo respondí: \" no mamá me he meadoo\" ','',3,0,1,0,7,NULL,'2009-05-09 17:47:20','2009-05-11 04:29:27'),(14,'me he convencido de que el amor no es para mi...en estos momentos sufro muxo..pero muxo..\r\nla mujer a la que le entrgue lo mas hermoso que le puedo dar...parece que solo queria algo de un rato..pero yo buscaba el verdadero amor y pense que lo habia encontrado.\r\nahora yo la llamo ,,pero ella me ignora..\r\nme duele muxo el corazon..me siento mal..triste...\r\nahhhhhhhhhhhhhhhhhhhhhhhh......\r\nno se que aser-...','',1,0,1,0,5,NULL,'2009-05-10 03:04:51','2009-05-11 03:07:46'),(15,'hola estoy un poco triste porq amo a un hombre que es mi mejor amigo y el anteroirmente estba mui enamorado de mi pero ahora me ignora porque lo rechaze entonces antes de perderlo le pedi que sea mi novio y me dijo que no porq el qria empezar una vida sin mi y ahora me encontre en la misma situacion con otrio amigo y me puse de novia esta vez nose que hacer porque no qiero perder a nadie mas pero si se entera el hombre del q estoy enamorada que estoy de novia el ahi si que no me habla jamas que hago?','flor_sweetchild_24@hotmail.com',0,4,1,0,7,NULL,'2009-05-10 03:50:14','2009-05-10 21:19:45'),(16,'Al llegar a mi pueblo para las vacaciones de Navidad, la borrachera fue tal que tras varios muchos chupitos, mucho mucho ron, y las copas que pillara, tras salir de la disco vi a una antigua amiga sobre la que me abalancé corriendo desde 20m, con tal mala fortuna que arrastré la cara por el suelo. Convencido de que no era nada mandé a los amigos hacia otro pub y yo a curarme las heridas a casa para luego volver... \r\nCual fue mi sorpresa al mirarme al espejo con toda la cara reventada, que decidí comer algo, esconder el móvil en un armario de la cocina (no atinaba a ponerlo en silencio), y echarme TROMBOCID en las heridas...\r\nResultado: al día siguiente me levanté debido al hedor de la pota al lado de la cama mezclado con el escozor/olor del trombocid (en cuya caja ponía en negrita NO ECHAR EN HERIDAS ABIERTAS), pensando que había perdido el móvil y mis padres gritando que siempre soy el mismo desgraciao que se emborracha y busca peleas...\r\n\r\nFui inocente de todo! ^^','',4,0,1,0,3,NULL,'2009-05-10 12:56:51','2009-05-10 21:09:56'),(17,'Bueno pues conoci a u  muchacho por internet el me dijo que conectara mi cam la conecte segun el le guste segun nos hicimos novios pero el no s conectaba los dias que quedamos y yo le reclamaba el decia que tenia problemas y no se conectaba hasta quiensabe cuando y solo por corto tiempo y de repente desaparecio de la nada me borro de su correo y de swu vida y yo no lo olvido me duele como chingados le hago para no recordar si loo unico que quiero es una razon del porque pero todos dicen o hablan de amor cuando an pasado años y yo dias no se que hacer quiciera tener halsheimer ','',0,3,1,0,5,NULL,'2009-05-11 00:18:56','2009-05-11 07:38:39'),(18,'hace unos meses termine con mi novia llevabamos una relacion de casi 3 años el primer año q stubimos juntos fue uno de los mejores de toda mi vida si no es q el mejor yo m enamore d ella, ella era mi motor de ahi sacaba fuerzas para todo por ella simepre keria ser el mejor era el hombre mas feliz del mundo despues d ese año yo tube q irme 3 meses a chiapas para hacer mi servicio social, stando a ya ella m hablaba m decia q m keria q me extrañaba q en ste tiempo c habia dado cuenta d lo mucho q m keria.\r\n(ella antes d star conmigo tubo una relacion q duro komo 4 años despues terminaron y c separaron despues la conoci yo) al regresar a la cd de mexico q m comento q su comu c habia descompuesto y q la tenia q enviar a componer y para sto la mando a componer con su ex y creo q dsd ai empeso a frecuentar a su ex, todo cambi ella aveces era tan indiferente conmigo yo siempre q notaba eso m dolia m sentia mal y le preguntaba q si pasaba algo pero ella decia q no, haci paso nuestro segundo año d relacion yo stab muy confundido por eso, sin darme cuenta entre en una depresion y desconfianza por q no la keria perder, el ultimo año q pase con ella a sido unos de los peores d mi vida no keria darme cuenta q ella andaba con los 2 mi corazon lo sabia pero yo m negaba a aceptar eso, yo luche para q ella c quedara conmigo y lo dejara a el hacia d todo, tenia detalles con ella era muy cariñoso m desvivia por ella hasta q un dia decidi terminar con eso,termianos la relacion pero aveces veia a la chika y una vez m dijo q luchara por ella y eso m ilusiono mucho,yo hacia mas cosas por ella tenia muchos mas detalles por ella, todo lo q hacia era por ella, como no m alcanzaba el dinero para llevarla al cine o a komer o simplemente no podia pagar el transporte publico decidi buscar trabajo solo para q ella tubiera lo mejor pero eso nos distancio mucho y ahora si nos emos separado totalmente y la extraño kiero buscarla y lo uniko q m detiene es el pensar si ella algun dia valoro todo mi sfuerzo, q si m hubiera kerido nuka m hubiera echo eso, nunka hubiera dejado q sufriera d esa manera.\r\navveces pienso q solo m utilizo solo jugo konmigo, yo era el idiota q la paseaba cunado el otro tipo no podia star con ella, ahora trato d q todo eso pase ese sentimiento q no c como definir de odio tristesta pero tambien d amor ...komo odiar a la persona de la q m enamore, pero tambien komo perdonarla d lo q m hizo...ahora todos mis amigos kieren presenterme a chavas segunq para olvidar y yo la verdad no kiero konocer a alguien eso no kiere decir q ste cerrando mi corazon...bueno esa es mi historia un poko larga creoq les dar flojera leerla, pero si la leen spero q les pueda servir d algo y no nadamas pa reirc d mi y is puede dar consejos tambien son bienvenidos gracias  \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n  \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n',NULL,0,0,1,0,5,7,'2009-05-11 04:09:38','2009-05-11 04:09:38'),(19,'De una vez voy a ir al grano como me gusta. Un puto dia estaba hablando por fono con una de mis ex q era del cole y la muy pendeja sigue arrecha por mi y me estaba jodiendo con que ya no tiraba como antes y yo me empute y le dije si quieres te tiro mañana para q veas lo cabron que soy y ella arrecha obvio que acepto. Y haci al dia siguiente nos encontramos al cacho la lleve a un motel, nos sacamos la puta ropa y me la tire como nunca y como estaba tan cachondo me tire hasta por el culo y lo mas de la puta al ultimo me la chupo como helado y le termine todo en su carita....................',NULL,0,0,1,0,6,10,'2009-05-11 16:52:08','2009-05-11 16:52:08');
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,1,'Story','2009-05-05 21:43:19'),(2,2,1,'Story','2009-05-05 21:43:19'),(3,3,1,'Story','2009-05-05 21:43:19'),(4,4,2,'Story','2009-05-05 21:44:01'),(5,5,2,'Story','2009-05-05 21:44:01'),(6,6,2,'Story','2009-05-05 21:44:01'),(7,7,2,'Story','2009-05-05 21:44:01'),(8,8,15,'Story','2009-05-10 03:50:15'),(9,9,15,'Story','2009-05-10 03:50:15');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Borrachera'),(2,'vómito'),(3,'padres'),(4,'Trabajo'),(5,'mierda'),(6,'cagar'),(7,'asco'),(8,'princesa'),(9,'desesperada');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activation_code` varchar(40) default NULL,
  `activated_at` datetime default NULL,
  `wants_newsletter` tinyint(1) default '1',
  `country_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fabito','fabian.dittrich@gmail.com','b7ddad454aa5b76c894bff574732d847233b4fe9','34bc47e61fac34b27835d3a21c463cf2d7efe1db','2009-05-05 21:40:37','2009-05-10 09:03:47',NULL,NULL,NULL,'2009-05-06 07:21:25',1,NULL),(2,'julia','elenacon@hotmail.com','9431b857b65359b3b9b26f38927c511895cab70a','71587f93deeae411595066a44ef75eec539d7002','2009-05-05 21:41:24','2009-05-05 21:41:56',NULL,NULL,NULL,'2009-05-05 21:41:56',1,NULL),(3,'Lary','lary696@hotmail.com','7b1d71bf08cd5e710a2ecae7dae7c7ceaa94ae51','fb516d1afecbd200a48a66e58895c9face847263','2009-05-07 20:17:59','2009-05-07 20:17:59',NULL,NULL,'a67cd6835e01a713a97e263cfbde735dc9ef4abc',NULL,1,NULL),(4,'marcelo alvarez','no_entryn@hotmail.com','073bd7004c349f5dada88254bc8cc3eea8518938','cf225160a3ae7afcec75cd12852d3ef70b3cf35b','2009-05-08 21:48:08','2009-05-10 03:07:03','889dca4e38d6cb5ef85997814b8fa2141421ea1e','2009-05-24 03:07:03',NULL,'2009-05-08 23:18:29',1,NULL),(5,'angie','isa_tkm_982009@hotmail.com','2a31e3836c137851ff72c467b83d87bac36c412c','658ea867b14d31c72727f3951a02575e02c0b299','2009-05-08 22:22:42','2009-05-08 22:22:42',NULL,NULL,'ddf4024e3befd0a5141f7c9871e5904947ce0a63',NULL,1,NULL),(6,'kaiser','hobbit_lacomarca@yahoo.com.mx','b654a31dc0600ceb59b6d505fafea31775b3d3c7','9027be35e6733e443803707b6dc7ffac4a85802b','2009-05-11 00:25:06','2009-05-11 00:25:06',NULL,NULL,'f946a1eb05d2c640c2cf9d8a77170b5093b57bf2',NULL,1,NULL),(7,'pavel','koin10@hotmail.com','ef494148cd77a2c9b05986984907d2614c7b9ec2','4b7a260b5a3150f8d9514cdd259f4ce7ce986ee5','2009-05-11 03:16:40','2009-05-11 05:27:53',NULL,NULL,NULL,'2009-05-11 05:27:53',1,NULL),(8,'leo_msn','world_2008@msn.com','87c66177c3010d7097e3435b3646b916cac4ca50','5dd96bd75f51616612f2ae691f5a7765f5fbdc10','2009-05-11 03:26:16','2009-05-11 03:26:16',NULL,NULL,'23eaddf0f00b77db9fc534718fcb48551b72f6b9',NULL,1,NULL),(9,'zaurin','fygs_tauro','d05de4de8ee5fab82595bfe7be63118879b6a0e1','255a5f16e27e167bc58fff56d458497928d7adfa','2009-05-11 04:18:28','2009-05-11 04:18:28',NULL,NULL,'7c95b1c42aab9bb1826796e029784109ce51af3e',NULL,1,NULL),(10,'Bryan','bry_vanroy@hotmail.com','203dc412853687d4ac9aa479d2fc0a1bcd1052ef','df6e543b4cd161e097c0e8f80522e7250d4c0bee','2009-05-11 16:44:33','2009-05-11 16:44:33',NULL,NULL,'1d77a8a2c045aa45c3f22e2daa2f8b39a4696d0e',NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-05-11 18:31:08
