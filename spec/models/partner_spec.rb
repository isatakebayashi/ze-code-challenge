require 'rails_helper'

RSpec.describe Partner, type: :model do
  context 'with valid attributes' do
    it 'saves the partner' do
      params = {
        id: 1,
        owner_name: 'ze-delivery',
        trading_name: 'ze-challenge',
        document: '12345678909',
        coverage_area: {
          type: 'MultiPolygon',
          coordinates: [
            [
              [
                -12.345,
                -22.456
              ],
              [
                -56.098,
                -98.765
              ]
            ]
          ]
        },
        address: {
          type: 'Point',
          coordinates: [
            -34.765,
            -34.987
          ]
        }
      }.as_json

      partner = described_class.new(params)
      expect(partner.save).to be_truthy
    end
  end

  context 'with invalid attributes' do
    it 'returns an error' do
      params = {
        id: 1,
        owner_name: 'ze-delivery',
        trading_name: 'ze-challenge',
        coverage_area: {
          type: 'MultiPolygon',
          coordinates: [
            [
              [
                -12.345,
                -22.456
              ],
              [
                -56.098,
                -98.765
              ]
            ]
          ]
        },
        address: {
          type: 'Point',
          coordinates: [
            -34.765,
            -34.987
          ]
        }
      }.as_json

      expect{ described_class.create(params) }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
