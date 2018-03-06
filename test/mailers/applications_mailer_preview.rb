class ApplicationsMailerPreview < ActionMailer::Preview

  def sample
    ApplicationsMailer.congratulations(User.first, Job.first)
  end
end