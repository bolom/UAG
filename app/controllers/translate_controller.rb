class TranslateController < ApplicationController
    before_filter :login_required 
  def index  
  #  @view_translations = ViewTranslation.find(:all, :conditions => [ 'text IS NULL AND language_id = ?', Locale.language.id ], :order => 'text') 
    @view_translations = ViewTranslation.find(:all, :conditions => [ 'language_id = ?', Locale.language.id ], :order => 'text') 
  end 

  def translation_text 
    @translation = ViewTranslation.find(params[:id]) 
    render :text => @translation.text || ""  
  end 

  def set_translation_text 
    @translation = ViewTranslation.find(params[:id]) 
    previous = @translation.text 
    @translation.text = params[:value] 
    @translation.text = previous unless @translation.save 
    render :partial => "translation_text", :object => @translation.text  
  end
end
