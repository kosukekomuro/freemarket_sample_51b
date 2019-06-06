# サーバーサイド実装するたびに追加
crumb :root do
  link "LOVE", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
end

crumb :cards_index do
  link "支払い方法", cards_path
  parent :mypages
end

crumb :cards_new do
  link "クレジットカード情報入力", new_card_path
  parent :cards_index
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
