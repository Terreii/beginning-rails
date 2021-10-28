class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /@drafts\./i => :draft_articles
end
