class UsersDatatable < Datatable
  delegate :user_path, :edit_user_path, :button_to, :delete_user_path, to: :@view, allow_nil: true

  def as_json(_options = {})
    {
      data: data,
      draw: params[:draw].to_i,
      recordsTotal: User.count,
      recordsFiltered: users.length
    }
  end

  private

  def data
    users.map do |user|
      [
        user.id,
        user.email,
        user.name,
        user.created_at.strftime("%B %d, %Y"),
        user.mistakes.count,
        edit_link(user),
        delete_button(user)
      ]
    end
  end

  def edit_link(user)
    "<a href='#{edit_user_path(user)}'>View/Edit</a>"
  end

  def delete_button(user)
    <<-HTML
    <form action="#{user_path(user)}" method="post">
      <input type="hidden" name="_method" value="delete">
      <input type="submit" value="Delete" data-confirm="Are you sure?">
    </form>
    HTML
  end

  def columns
    @columns ||= %w['' '']
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    User.all
  end
end
