desc "Copie les enseignants et les profs" 
task :copy_prof_and_ens => :environment do
  
  puts "Copie des enseignements"
  Enseignement.find(:all).each do |e|
    e.libelle_en = e.libelle
    e.contenu_en = e.contenu
    e.objectif_en = e.objectif
    e.plan_en = e.plan
    e.evaluation_en = e.evaluation
    e.remarque_en = e.remarque 
    e.save
  end
end


