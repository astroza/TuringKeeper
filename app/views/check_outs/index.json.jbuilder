json.array!(@check_outs) do |check_out|
  json.extract! check_out, :id, :turing_user_id
  json.url check_out_url(check_out, format: :json)
end
