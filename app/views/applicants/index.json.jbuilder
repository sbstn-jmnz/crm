json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :title, :description
  json.url applicant_url(applicant, format: :json)
end
