# frozen_string_literal: true

RSpec.describe Statistics do
  let(:dummy) { Class.new { extend Statistics } }
  let(:file_path) { 'spec/fixtures/test.yml' }
  let(:directory_name) { 'spec/fixtures' }
  let(:result) do
    { user: 'Petro',
      difficulty: :easy,
      attempts_used: 10,
      hints_used: 2,
      total_attempt: 5,
      total_hint: 3 }
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
    Dir.rmdir(directory_name) if File.exist?(directory_name)
  end

  before do
    Dir.mkdir(directory_name) unless File.exist?(directory_name)
    stub_const('Statistics::PATH_FILE', file_path)
  end

  describe 'load from empty DB' do
    it { expect(dummy.load_from_db).to eq [] }
  end

  describe 'save to DB' do
    before { dummy.save_date(result) }

    it { expect(File.exist?(file_path)).to be true }

    it 'successfully save DB file ' do
      statistics = File.open(file_path, 'r', &:read)
      expect(statistics).to include('Petro')
    end
  end
end
