crumb :root do
  link "トップページ", root_path
end

crumb :edit_user do
  link "マイページ", edit_user_path
  parent :root
end

crumb :company do
  link "訪問先 登録", companies_path
  parent :root
end

crumb :report do
  link "日報一覧", new_report_path(current_user.id) 
  parent :root
end

crumb :comment do
  link "コメント", report_path
  parent :report
end

crumb :edit_report do
  link "編集", report_path
  parent :report
end

crumb :company_edit do
  link "編集", company_path
  parent :company
end

crumb :company_show do
  link "詳細", company_path
  parent :company
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