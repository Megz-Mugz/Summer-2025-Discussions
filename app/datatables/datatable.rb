class Datatable
  delegate :params, :link_to, :mail_to, to: :@view
  attr_accessor :current_user
  SORT_DIRECTION = {
    :asc => 'asc'.freeze,
    :desc => 'desc'.freeze
  }
  def initialize(view,user=nil)
    @view = view
    @current_user = user
  end
  def to_csv(options = {})
    @generating_csv = true
    csv_data = CSV.generate do |csv|
      csv << csv_human_column_names
      data.each do |datum|
        csv << csv_body_row(datum)
      end
    end
    return csv_data
  end
  private
  def csv_body_row(datum)
    row = []
    datum.map.with_index do |val, idx|
      row << val unless csv_skip_columns.include?(idx)
    end
    row
  end
  def csv_skip_columns
    #interface method
    []
  end
  def data
    #interface method
  end
   def sort_order
    #interface method
  end
  def csv_human_column_names
    #interface method - uses columns if nil
    columns.first(columns.size)
  end
  private
  def page
    params[:start].to_i/per_page + 1
  end
  def total_entry_count
    return 10
  end
  def per_page
    if @generating_csv
      total_entry_count
    else
      params[:start].to_i >= 0 ? params[:length].to_i : 10
    end
  end
  def sort_column
    if params[:order].present?
      columns[params[:order]["0"][:column].to_i]
    else
      columns[0]
    end
  end
  def sort_direction
    if @generating_csv
      params[:order] = "desc"
    else
      if params[:order].present?
        params[:order]["0"][:dir]
      else
        'asc'
      end
    end
  end
end
