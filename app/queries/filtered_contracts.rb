class FilteredContracts
  def initialize(params)
    @shift_id = params[:shift_id]
    @page = params[:page].presence || 0
    @per_page = params[:per_page].presence || 50
  end

  def call
    Contract.all
      .then(&method(:by_shift_uuid))
      .limit(per_page)
      .offset(offset)
  end

  private

  attr_reader :shift_id, :page, :per_page

  def by_shift_uuid(contracts)
    return contracts unless shift_id

    contracts.for_shift_uuid(shift_id)
  end

  def offset
    per_page * (page.zero? ? 0 : page - 1)
  end
end
