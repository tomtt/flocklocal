IMAGE_MIME_TYPES = [
      'image/jpeg',
      'image/gif',
      'image/png',
      # Grrrr... IE
      'image/pjpeg',
      'image/jpg',
      'image/x-png',
  ]

# Base paths for attachments
if RAILS_ENV == 'test'
  AVATAR_ATTACHMENT_BASE = 'avatars-test'
else
  AVATAR_ATTACHMENT_BASE = 'avatars'
end
