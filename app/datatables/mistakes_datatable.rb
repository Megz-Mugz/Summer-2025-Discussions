class MistakesDatatable < Datatable
  delegate :edit_mistake_path, to: :@view, allow_nil: true
  delegate :mistake_path, to: :@view, allow_nil: true

  def as_json(_options = {})
    {
      data: data,
      draw: params[:draw].to_i,
      recordsTotal: Mistake.count,
      recordsFiltered: mistakes.length
    }
  end

  private

  def data
    mistakes.map do |mistake|
      [
        mistake.id,
        mistake.name,
        mistake.description,
        mistake.created_at.strftime("%B %d, %Y"),
        edit_link(mistake),
        delete_button(mistake)
      ]
    end
  end

  def edit_link(mistake)
    "<a href='#{edit_mistake_path(mistake)}'>View/Edit</a>"
  end

  def delete_button(mistake)
    <<-HTML
    <form action="#{mistake_path(mistake)}" method="post">
      <input type="hidden" name="_method" value="delete">
      <input type="submit" value="Delete" data-confirm="Are you sure?">
    </form>
    HTML
  end

  def columns
    @columns ||= %w['' '']
  end

  def mistakes
    @mistakes ||= fetch_mistakes
  end

  def fetch_mistakes
    # SQL
    # JOINS => MIDDLE MAN TABLE
    # COUNT() => number of mistakes per user
    Mistake.all
  end
end
