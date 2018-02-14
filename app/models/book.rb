class Book < Edumaterial
  has_attached_file    :file
  
  validates_attachment :file, presence: true, size: { in: 0..100.megabytes },
                       content_type: { content_type:
                                                [
                                                  "application/octet-stream",
                                                  "application/msword",
                                                  "application/empty",
                                                  "application/pdf",
"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
"image/vnd.djvu", "image/vnd.djvu+multipage"
                                                ]
                                            }

  validates_attachment_file_name :file, matches: [ /djvu\Z/i , /docx?\Z/i, /pdf\Z/i ]
  
end
