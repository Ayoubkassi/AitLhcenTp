require 'csv'


class Adherent
  # attr_reader :first_namen, :last_name
  # attr_writer :first_name, :last_name
  #constructor
  @@id = 0
  @@liste_adherent= Hash.new()
  def initialize
    #puts "New Adherent is Created"
    @@id +=1
  end

  def id
    @@id
  end

  # def to_string
  #   return "prenom : #{first_name} , nom : #{last_name}"
  # end

  def self.getAllAdherent
    return @@liste_adherent
  end

  def addAdherent
    @@liste_adherent[@@id] = self
  end

  def toString
    return "nom : #{last_name}, prenom : #{first_name}"
  end

  #getters and setters
  attr_accessor  :first_name, :last_name , :liste_adherent

end


class Document
  @@isbn=0
  @@liste_document= Hash.new()

  def initialize
    @@isbn +=1
    #puts "New Document is Created"
  end

  def isbn
    @@isbn
  end

  def auteur
    @auteur
  end

  def type
    @type
  end

  def type(my_type)
    #verifier si type parmis existant
    @type = my_type
  end

  def auteur(my_auteur)
    @auteur = my_auteur
  end

  def self.getAllDocument
    return @@liste_document
  end

  def addDocument
    @@liste_document[@@isbn] = self
  end

  def toString
    return "name :#{name} , auteur : #{auteur} , type : #{type} , is_empruntable : #{is_empruntable}"
  end

  attr_accessor :name, :is_empruntable, :auteur, :type , :liste_document

end

class Auteur
  @@liste_auteur= Hash.new()
  @@id = 0
  def initialize
    #puts "New Auteur is Created"
    @@id +=1
  end

  def id
    @@id
  end

  def self.getAllAuteur
    return @@liste_auteur
  end

  def addAuteur
    @@liste_auteur[@@id] = self
  end
  attr_accessor :name , :liste_auteur
end

class Materiel
  @@id=0
  @@liste_materiel= Hash.new()

  def initialize
    @@id +=1
    #puts "New Document is Created"
  end

  def id
    @@id
  end

  def self.getAllMateriel
    return @@liste_materiel
  end

  def addMateriel
    @@liste_materiel[@@id] = self
  end

  def toString
    return "name : #{name}, is_empruntable : #{is_empruntable} ,type : #{type}"
  end
  attr_accessor :name , :is_empruntable , :type

end

#execute code
# ayoub = Adherent.new
# ayoub.first_name = "Ayoub"
# ayoub.last_name = "Kassi"
# puts ayoub.first_name
# puts ayoub.id
# puts ayoub.to_string()
# ayoub.addAdherent(ayoub.last_name, ayoub.first_name)

# my_list = Hash.new()
# my_list[0] = "AyoubKassi"
# puts my_list.inspect

# puts "#################"
#
# maroua = Adherent.new
# maroua.first_name = "Maroua"
# maroua.last_name = "El Azzaoui"
# puts maroua.first_name
# puts maroua.id
# maroua.addAdherent(maroua.last_name , maroua.first_name)
# # maroua.liste_adherent[maroua.id] = maroua.to_string()
#
# puts Adherent.getAllAdherent().inspect


repeat = true
$empruntable_livre = 0
$empruntable_ordinateur = 0


while repeat
  # puts "******************************************************************"
  # puts "******************************************************************"
  puts "****************************** Menu ******************************"
  # puts "******************************************************************"
  # puts "******************************************************************"
  puts " 1 - Crée un adhérent et l'ajoute à la bibliothèque"
  puts " 2 - Crée un livre et l'ajoute à la bibliothèque"
  puts " 3 - Crée un ordinateur portable et l'ajoute à la bibliothèque"
  puts " 4 - Retourne un adhèrent correspondant à un id de personne"
  puts " 5 - Retourne un document correspondant à un ISBN"
  puts " 6 - Retourne un matériel correspondant à un id"
  puts " 7 - Retourne la collection des adhérents de la bibliothèque"
  puts " 8 - Retourne la liste des documents de la bibliothèque"
  puts " 9 - Retourne la collection des matériels de la bibliothèque"
  puts " 10 - Ajoute une personne aux auteurs d’un livre."
  puts " 11 - Retourne un auteur d’un livre correspondant à un id"
  puts " 12 - Retourne L'ensemble des Ids des auteurs"
  puts " 13 - Retourne L'ensemble des Id des matériels"
  puts " 14 - Supprime un adhérent de la bibliothèque"
  puts " 15 - Supprime un matériel de la bibliothèque"
  puts " 16 - Supprime un document de la bibliothèque"
  puts " 17 - Emprunter un Ordinateur"
  puts " 18 - Emprunter un Livre"
  puts " 19 - Rendre un Ordinateur"
  puts " 20 - Rendre un Livre"
  puts " 21 - Enregistre la bibliothèque dans des fichiers CSV"
  puts " 22 - Charge la bibliothèque à partir des fichiers CSV"



  print "choisir un nombre pour effectuer une action : "
  choix = gets.to_i
  if( choix == 1)
    new_adherent = Adherent.new
    puts "Entrer le prenom d'adherent : "
    new_adherent.first_name = gets.to_s.strip
    puts "Entrer le nom d'adherent : "
    new_adherent.last_name = gets.to_s.strip
    puts "-> New Adherent has been created"
    new_adherent.addAdherent()
    print "Si vous voulez repeter le programme tapez 1 sinon 0 : "
    num = gets.to_i
    repeat = num == 1 ? true : false
  elsif (choix == 2)
    new_livre = Document.new
    new_livre.is_empruntable = false
    new_livre.type="livre"
    puts "Entrer le nom du Livre :"
    new_livre.name = gets.to_s.strip
    puts "Entrer l'auteur du Livre : "
    auteur = Auteur.new
    auteur.name = gets.to_s.strip
    new_livre.auteur = auteur.name
    auteur.addAuteur()
    puts "-> New Book has been created"
    new_livre. addDocument()
    print "Si vous voulez repeter le programme tapez 1 sinon 0 : "
    num = gets.to_i
    repeat = num == 1 ? true : false
  elsif (choix == 3)
    new_materiel = Materiel.new
    new_materiel.is_empruntable = true
    new_materiel.type="ordinateur portable"
    puts "Entrer le nom du Laptop : "
    new_materiel.name = gets.to_s.strip
    puts "-> New Laptop has been created"
    new_materiel.addMateriel()
    print "Si vous voulez repeter le programme tapez 1 sinon 0 : "
    num = gets.to_i
    repeat = num == 1 ? true : false
  elsif (choix == 4)
    puts "Entrer l'id du personne : "
    id = gets.to_i
    if(Adherent.getAllAdherent().has_key?(id))
      puts Adherent.getAllAdherent()[id].toString()
    else
      puts "Adherent avec ce id n'existe pas"
    end
  elsif (choix == 5)
    puts "Entrer l'ISBN du document : "
    isbn = gets.to_i
    if(Document.getAllDocument().has_key?(isbn))
      puts Document.getAllDocument()[isbn]
    else
      puts "Document avec ce ISBN n'existe pas"
    end
  elsif (choix == 6)
    puts "Entrer l'id du materiel : "
    id = gets.to_i
    if(Materiel.getAllMateriel().has_key?(id))
      puts Materiel.getAllMateriel()[id]
    else
      puts "Materiel avec ce id n'existe pas"
    end
  elsif (choix == 7)
    puts "la liste des adherents est : "
    puts "#{Adherent.getAllAdherent().inspect}"
  elsif (choix == 8)
    puts "la liste des documents est : "
    puts "#{Document.getAllDocument().inspect}"
  elsif (choix == 9)
    puts "la liste des materiels est : "
    puts "#{Materiel.getAllMateriel().inspect}"
  elsif (choix == 10)
    puts "Entrer lisbn du livre : "
    isbn = gets.to_i
    if((Document.getAllDocument().has_key?(isbn)) && Document.getAllDocument()[isbn].type == "livre")
      puts "Entrer l'auteur du livre : "
      auteur = gets.to_s.strip
      Document.getAllDocument()[isbn].auteur = auteur
    else
      puts "probleme avec l'isbn"
    end

  elsif (choix == 11)
    puts "entrer id de l'auteur : "
    id = gets.to_i
    if(Auteur.getAllAuteur().has_key?(id))
      puts "nom de l'auteur est : #{Auteur.getAllAuteur()[id].name}"
    else
      puts "id n'existe pas"
    end

  elsif (choix == 12)
    puts "Voila l'ensemble des id des auteur :"
    Auteur.getAllAuteur().each_key{ |id|
      print "#{id}   "
     }
    puts "\n"
  elsif (choix == 13)
    puts "Voila l'ensemble des id des Materiels :"
    Materiel.getAllMateriel().each_key{ |id|
      print "#{id}   "
     }
    puts "\n"
  elsif (choix == 14)
    puts "Entrer l'id de l'adherent que vous voulez supprimer"
    id = gets.to_i
    if(Adherent.getAllAdherent().has_key?(id))
      Adherent.getAllAdherent().delete(id)
      puts "Adherent supprimer avec succes"
    else
      puts "Id n'existe pas"
    end
  elsif (choix == 15)
    puts "Entrer l'id du materiel que vous voulez supprimer"
    id = gets.to_i
    if(Materiel.getAllMateriel().has_key?(id))
      Materiel.getAllMateriel().delete(id)
      puts "Materiel supprimer avec succes"
    else
      puts "Id n'existe pas"
    end
  elsif (choix == 16)
    puts "Entrer l'isbn du document que vous voulez supprimer"
    isbn = gets.to_i
    if(Document.getAllDocument().has_key?(isbn))
      Document.getAllDocument().delete(isbn)
      puts "Document supprimer avec succes"
    else
      puts "ISBN n'existe pas"
    end
  elsif (choix == 17)
    puts "Emprunter un Ordinateur"

    if($empruntable_ordinateur == 0)
      puts "Entrer l'id d'ordinateur portable : "
      id = gets.to_i
      laptops = Materiel.getAllMateriel().select{ |cle , valeur|
          valeur.type == "ordinateur portable"
       }
      if(laptops.has_key?(id))
        laptops[id].is_empruntable = true
        $empruntable_ordinateur+=1
        puts "Laptop emprunter avec succes"
      end
    else
      puts "Vous avez deja emprunter 1 pc portable"
    end
    # if($empruntable_ordinateur == 0) then
    #   puts "Entrer l'id d'ordinateur portable : "
    #   id = gets.to_i
    #   laptops = Materiel.getAllMateriel().select{ |cle, valeur|
    #      valeur.type == "ordinateur portable"
    #    }
    #
    #   if(laptops.has_key?(id)) then
    #     laptops[id].is_empruntable = true
    #     $empruntable_ordinateur++
    #
    #   end
    # else
    #   puts "Vous avez deja emprunter 1 pc portable"
    # end

  elsif (choix == 18)
    puts "Emprunter un Livre"
    if($empruntable_livre < 5)
      puts "Entrer l'id d'ordinateur portable : "
      id = gets.to_i
      books = Document.getAllDocument().select{ |cle, valeur|
        valeur.type == "livre"
      }
      if(books.has_key?(id))
        books[id].is_empruntabl = true
        $empruntable_livre+=1
        puts "Livre emprunte avec succes"
      else
        puts "Id existe mais c pas un livre"
      end
    else
      puts "Vous avez deja emprunter 5 livres"
    end
  elsif (choix == 19)
    #verifier si deja empruntable
    laptops_empruntables = Materiel.getAllMateriel().select{ |cle , valeur|
      valeur.type == "ordinateur portable" && valeur.is_empruntable == true
    }

    puts "entrer l'id d'ordinateur portable : "
    id = gets.to_i
    if(laptops_empruntables.has_key?(id))
      puts "Laptop rendu avec succes"
    else
      puts "id n'existe pas"
    end
  elsif (choix == 20)
    #verifier si deja emoruntable
    books_empruntables = Document.getAllDocument().select{ |cle , valeur|
      valeur.type == "livre" && valeur.is_empruntable == true
    }

    puts "entrer l'id de livre : "
    id = gets.to_i
    if(books_empruntables.has_key?(id))
      puts "Livre rendu avec succes"
    else
      puts "id n'existe pas"
    end
  elsif (choix == 21)
    Biblio = Hash.new()
    Biblio["adherent"]= Adherent.getAllAdherent()
    Biblio["materiels"] = Materiel.getAllMateriel()
    Biblio["documents"] = Document.getAllDocument()

    CSV.open("data.csv", "wb") {|csv| Biblio.to_a.each {|elem| csv << elem} }
    puts "La bibliothèque est Enregistre dans un fichier CSV"

  elsif (choix == 22)
    puts "Entrer le nom du fichier CSV : "
    csv_name = gets.to_s.strip
    
  else
    puts "********************************************************"
    puts "-> veuillez choisir un nombre qui existe dans la liste!!"
    puts "********************************************************"
    repeat = true
  end
end
