require 'rubygems'
require 'simple-rss'
require 'open-uri'

class PagesController < ApplicationController
  before_filter :find_all_objects,  :only     =>    [:master, :formations]
  before_filter :find_all_parcours, :only     =>    [:master, :formations]
  
  #Lister tous les ensiengements de licences
  def formations; end
  #Lister tous les ensiengements de Master
  def master;end
  
  def index
    #feed_url = 'http://blog.uag-histoire.com/feed/atom.xml' 
    #@feed = SimpleRSS.parse open(feed_url)
  end
  
  #ajouter le path d'un documents dans un textarea
  def add_doc
    flash[:notice] = "Successfully created..."
    respond_to do |type| 
     # type.html { flash[:notice] = "L'enseignant à été modifié"; redirect_to enseignant_path(@enseignant) }  
      type.js {@saved = true} 
    end
  end
  
  def partenaires
     @universites = Universite.find(:all)
  end
  
  protected 
  def find_all_objects
      @enseignements = Enseignement.find(:all)
  end
end
  
