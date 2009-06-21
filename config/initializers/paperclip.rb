if RAILS_ENV == "production"
  Paperclip.options[:image_magick_path] = '/usr/bin/'
end
