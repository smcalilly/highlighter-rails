module Tagger
  def find_or_create_tags(params, user_id)
    tag_names = params[:tag_list].split(",").collect{|s| s.strip.downcase}.uniq
    @tags = tag_names.collect { |name| Tag.create_with(user_id: user_id).find_or_create_by(name: name) }
    
    @tags.each do |tag|
      authorize tag
    end
    
    return @tags
  end
end