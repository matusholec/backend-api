class ContractSerializer
  def initialize(contract)
    @contract = contract
  end

  def to_json
    Oj.dump(to_h)
  end

  def to_h
    {
      id: contract.uuid,
      shift_id: contract.shift_uuid,
      candidate_name: contract.candidate_name
    }.stringify_keys
  end

  private

  attr_reader :contract
end
