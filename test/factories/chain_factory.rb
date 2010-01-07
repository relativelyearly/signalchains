Factory.define :chain do |chain|
  chain.sequence(:name) {|n| "Chain #{n}"}
  chain.association :user
end