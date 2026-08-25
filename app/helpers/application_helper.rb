module ApplicationHelper
  def active_for(path: nil, controller: nil)
    if path && path == request.path || controller && controller == controller_name
      'active'
    end
  end
end
