module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def create_current_prices
    pids = [25608601, 53160687, 46953386, 10619648, 15053343,
            90102265, 26138797, 68476510, 44400669, 61052544]
    pids.each do |pid|
      create(:api_v1_current_price, pid: pid)
    end
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end
