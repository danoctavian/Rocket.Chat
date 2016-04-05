Meteor.methods
  setBio: (bio) ->
    if not Meteor.userId()
      throw new Meteor.Error('invalid-user', "[methods] setBio -> Invalid user")

    user = Meteor.user()

    if user.bio is bio
      return bio

    if _.trim bio
      bio = _.trim bio

    unless RocketChat.models.Users.setBio Meteor.userId(), bio
      throw new Meteor.Error 'could-not-change-bio', "Could not change bio"

    return bio