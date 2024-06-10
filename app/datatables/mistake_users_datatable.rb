class MistakeUsersDatatable < Datatable

  def as_json(_options = {})
    {
      data: data,
      draw: params[:draw].to_i,
      recordsTotal: MistakeUser.select(:user_id).distinct.count,
      recordsFiltered: MistakeUser.select(:user_id).distinct.count
    }
  end

  private

  def data
    unique_users.map do |user|
      [
        user.name,
        user.mistake_names.join(', ')
      ]
    end
  end

  def unique_users
    @unique_users ||= fetch_unique_users
  end

  def fetch_unique_users
    users = MistakeUser.select(:user_id).distinct.map(&:user_id)
    users.map do |user_id|
      user = User.find(user_id)
      mistakes = MistakeUser.where(user_id: user.id).includes(:mistake).pluck('mistakes.name')
      OpenStruct.new(id: user.id, name: user.name, mistake_names: mistakes)
    end
  end
end
