ActionController::Routing::Routes.draw do |map|
  
 # map.resources :mailling_lists, :path_prefix => ":locale" do |liste|
  #   liste.resources :couriels, :path_prefix => ":locale" 
  #end
  
  #map.resources :groupe_documents, :path_prefix => ":locale" do |groupe_documents|
  #   groupe_documents.resources :documents, :path_prefix => ":locale" 
  #end
  map.resources :groupe_documents, :has_many => [ :documents ]
  map.resources :mailling_lists, 
                              :has_many => [ :couriels ],:path_prefix => ":locale" 
  map.resources :sessions

  map.resources :enseignants, :path_prefix => ":locale"  
  map.resources :enseignements, :path_prefix => ":locale"
    
  map.resources :groupes, :path_prefix => ":locale" 
  map.resources :groupements, :path_prefix => ":locale" 
  map.resources :contributions, :path_prefix => ":locale" 
  map.resources :universites, :path_prefix => ":locale" 
         
  map.resources :users, :path_prefix => ":locale" 
  
  map.resources :documents,:path_prefix => ":locale" 
               # :name_prefix => 'all_', 
                #:collection => { :search => :get }
  
  # Install the default route as the lowest priority.
  map.connect ':locale/:controller/:action/:id'
  map.connect '', :controller => "Pages"
end
