Sequel::Model.plugin(:schema)
DB_CONFIG = YAML.load(File.read(File.join(PADRINO_ROOT, 'config', 'database.yml')))
DB = Sequel.connect(DB_CONFIG[Padrino.env.to_s], :loggers => [logger])

