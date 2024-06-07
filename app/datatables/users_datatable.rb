class UsersDatatable < Datatable
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
        user.created_at,
        user.mistakes.count
      ]
    end
  end
  def columns
    @columns ||= %w['' '']
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    # SQL
    # JOINS => MIDDLE MAN TABLE
    # COUNT() => number of mistakes per user
    users = User.all


    users
  end
end
