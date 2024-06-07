class MistakesDatatable < Datatable
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
        mistake.created_at,
      ]
    end
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
    mistakes = Mistake.all


    mistakes
  end
end
