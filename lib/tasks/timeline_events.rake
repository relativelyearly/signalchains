desc "Generate User Timeline Events"
task :timeline_events => [:environment] do
  TimelineEvent.all.each do |event|
    targets = eval("#{event.subject.class.to_s}.find(event.subject)").target
    targets.each do |target|
      UserTimelineEvent.create(:timeline_event => event, :target => target)
    end
  end
end