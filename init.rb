Redmine::Plugin.register :sezyum do
  name 'Sezyum'
  author 'Enes Gönültaş'
  description 'Redmine için Sezyum eklentisi'
  version '0.0.1'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'

  permission :sezyum, { :sezyum => [:index] }, :public => true
  menu :project_menu, :sezyum, { :controller => 'sezyum', :action => 'index' }, :caption => 'Sezyum', :after => :new_issue, :param => :project_id
end
