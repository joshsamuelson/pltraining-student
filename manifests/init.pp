class student {

  # configure user environment
  include userprefs::defaults

  # create local repos
  include localrepo

  # Add helper scripts
  include student::scripts

}
