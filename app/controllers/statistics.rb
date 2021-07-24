# frozen_string_literal: true

module Statistics
  PATH_FILE = 'statistics.yml'

  def save_date(result)
    File.open(PATH_FILE, 'a') { |file| file.write(result.to_yaml) }
  end

  def load_from_db
    return [] unless File.exist?(PATH_FILE)

    YAML.load_stream(File.read(PATH_FILE))
  end
end
