InyxCatalogueRails.setup do |config|
	config.domain = "localhost:3000"
	config.mailer_to = "email@email.com"
	config.authenticate = false
	config.active_index = true
	config.active_show = true
end