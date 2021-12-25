# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Validations::Team::Create do
  it 'requires name' do
    expect(subject.call({}).errors.to_h).to include(name: ['is missing'])
  end
end
