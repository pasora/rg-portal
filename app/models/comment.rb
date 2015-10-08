class Comment < ActiveRecord::Base
  include Emojifier
  include MarkdownRender

  belongs_to :user
  validates :content, presence: true

  after_save :notify_mentions

  MENTION_USER_REGEX = /@[A-z0-9]+/

  private

  def notify_mentions
    usernames = self.content.scan(MENTION_USER_REGEX).map { |mention| mention[0] }
    users = usernames.map { |username| User.find_by(nickname: username) }.compact
    # users.each do |user|
      # Slack.notify()
    # end
  end
end
