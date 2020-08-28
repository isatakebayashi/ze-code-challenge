require 'json'

namespace :import do
  desc 'Import partners data from json file and save to database'

  task partners_data: :environment do
    path = Rails.root.join('lib', 'tasks', 'partners_data.json')
    file = File.read(path)

    data = JSON.parse(file)

    data['pdvs'].each do |p|
      ActiveRecord::Base.transaction do
        Partner.create!(id: p['id'],
                        owner_name: p['ownerName'],
                        trading_name: p['tradingName'],
                        document: p['document'],
                        coverage_area: p['coverageArea'],
                        address: p['address'])
      rescue ActiveRecord::RecordInvalid => e
        puts "Partner id #{p['id']} error #{e}"
      rescue RGeo::Error::InvalidGeometry => e
        puts "Partner id #{p['id']} with invalids coordinates"
      rescue StandardError => e
        puts "Partner id #{p['id']} error #{e}"
      end
    end
  end
end
