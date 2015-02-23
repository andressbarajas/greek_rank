# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

University.delete_all
Fraternity.delete_all
Sorority.delete_all
FraternityChapter.delete_all
SororityChapter.delete_all
Post.delete_all
Rating.delete_all
Topic.delete_all
User.delete_all

fraternities = Fraternity.create([
                                  { name: 'Sigma Nu', letters: 'ΣΝ'}, 
                                  { name: 'Alpha Tao Omega', letters: 'ΑΤΩ'},
                                  { name: 'Alpha Epsilon Pi', letters: 'AEΠ'},
                                  { name: 'Alpha Gamma Rho', letters: 'ΑΓΡ'},
                                  { name: 'Delta Psi', letters: 'ΔΨ'},
                                  { name: 'Kappa Alpha Order', letters: 'ΚΑ'},
                                  { name: 'Phi Delta Theta', letters: 'ΦΔΘ'},
                                  { name: 'Pi Kappa Alpha', letters: 'ΠΚΑ'},
                                  { name: 'Tau Delta Phi', letters: 'ΤΔΦ'},
                                  { name: 'Zeta Beta Tau', letters: 'ΖΒΤ'}
                                ])

sororities = Sorority.create([
                              { name: 'Alpha Chi Omega', letters: 'ΑΧΩ'},
                              { name: 'Alpha Delta Pi', letters: 'ΑΔΠ'},
                              { name: 'Alpha Epsilon Phi', letters: 'ΑΕΦ'},
                              { name: 'Delta Delta Delta', letters: 'ΔΔΔ'},
                              { name: 'Gamma Phi Beta', letters: 'ΓΦΒ'},
                              { name: 'Phi Mu', letters: 'ΦΜ'},
                              { name: 'Sigma Kappa', letters: 'ΣΚ'},
                              { name: 'Zeta Phi Beta', letters: 'ΖΦΒ'},
                              { name: 'Alpha Phi', letters: 'ΑΦ'},
                              { name: 'Chi Omega', letters: 'ΧΩ'}
                            ])


sb_fraternity_chapters = FraternityChapter.create([
                                                   { chapter_name: 'Kappa Eta', fraternity: fraternities[1]},
                                                   { chapter_name: 'Beta Gamma', fraternity: fraternities[2]},
                                                   { chapter_name: 'Lamda Psi', fraternity: fraternities[3]},
                                                   { chapter_name: 'Alpha Phi', fraternity: fraternities[4]},
                                                   { chapter_name: 'Mu Pi', fraternity: fraternities[5]},
                                                   { chapter_name: 'Delta Rho', fraternity: fraternities[6]},
                                                   { chapter_name: 'Iota Mu', fraternity: fraternities[7]},
                                                   { chapter_name: 'Omega Nu', fraternity: fraternities[8]},
                                                   { chapter_name: 'Alpha', fraternity: fraternities[9]},
                                                   { chapter_name: 'Beta', fraternity: fraternities[10]}
                                                ])

sb_sorority_chapters = SororityChapter.create([
                                                   { chapter_name: 'Alpha', sorority: sororities[1]},
                                                   { chapter_name: 'Beta', sorority: sororities[2]},
                                                   { chapter_name: 'Gamma', sorority: sororities[3]},
                                                   { chapter_name: 'Delta', sorority: sororities[4]},
                                                   { chapter_name: 'Epsilon', sorority: sororities[5]},
                                                   { chapter_name: 'Zeta', sorority: sororities[6]},
                                                   { chapter_name: 'Eta', sorority: sororities[7]},
                                                   { chapter_name: 'Theta', sorority: sororities[8]},
                                                   { chapter_name: 'Iota', sorority: sororities[9]},
                                                   { chapter_name: 'Kappa', sorority: sororities[10]}
                                                ])

la_fraternity_chapters = FraternityChapter.create([   
                                                   { chapter_name: 'Eta Kappa', fraternity: fraternities[1]},
                                                   { chapter_name: 'Gamma Beta', fraternity: fraternities[2]},
                                                   { chapter_name: 'Psi Lamda', fraternity: fraternities[3]},
                                                   { chapter_name: 'Phi Alpha', fraternity: fraternities[4]},
                                                   { chapter_name: 'Pi Mu', fraternity: fraternities[5]},
                                                   { chapter_name: 'Rho Delta', fraternity: fraternities[6]},
                                                   { chapter_name: 'Mu Iota', fraternity: fraternities[7]},
                                                   { chapter_name: 'Nu Omega', fraternity: fraternities[8]},
                                                   { chapter_name: 'Alpha Beta', fraternity: fraternities[9]},
                                                   { chapter_name: 'Beta Alpha', fraternity: fraternities[10]}
                                                ])

la_sorority_chapters = SororityChapter.create([
                                                   { chapter_name: 'Lamda', sorority: sororities[1]},
                                                   { chapter_name: 'Mu', sorority: sororities[2]},
                                                   { chapter_name: 'Nu', sorority: sororities[3]},
                                                   { chapter_name: 'Xi', sorority: sororities[4]},
                                                   { chapter_name: 'Omicron', sorority: sororities[5]},
                                                   { chapter_name: 'Pi', sorority: sororities[6]},
                                                   { chapter_name: 'Rho', sorority: sororities[7]},
                                                   { chapter_name: 'Sigma', sorority: sororities[8]},
                                                   { chapter_name: 'Tau', sorority: sororities[9]},
                                                   { chapter_name: 'Upsilon', sorority: sororities[10]}
                                                ])


University.create({name: 'University of California, Santa Barbara', 
                   initials: 'UCSB', 
                   fraternity_chapters: sb_fraternity_chapters, 
                   sorority_chapters: sb_sorority_chapters})

University.create({name: 'University of California, Los Angeles', 
                   initials: 'UCLA', 
                   fraternity_chapters: la_fraternity_chapters, 
                   sorority_chapters: la_sorority_chapters})


Topic.create({university_id: University.first.id,
              subject: "bibendum", 
              nick_name: "Michael", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.first.id,
              subject: "viverra mi", 
              nick_name: "John", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.first.id,
              subject: "felis sit amet", 
              nick_name: "Siggy", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.first.id,
              subject: "interdum elit", 
              nick_name: "Tiffany", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.second.id,
              subject: "adipiscing elit", 
              nick_name: "Chris", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.second.id,
              subject: "lacinia felis", 
              nick_name: "Melodie", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.second.id,
              subject: "efficitur pharetra", 
              nick_name: "Patrick", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.second.id,
              subject: "felis eleifend", 
              nick_name: "Carroll", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})

Topic.create({university_id: University.second.id,
              subject: "Lorem ipsum", 
              nick_name: "Pedro", 
              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent " +
                       "gravida lacinia felis sit amet tincidunt. Nam a enim eget felis eleifend " +
                       "volutpat id eget eros. Curabitur tincidunt efficitur pharetra. Ut sagittis " +
                       "interdum elit ut bibendum. Ut sit amet viverra mi, id pharetra leo. Cras " +
                       "ac commodo dolor."})
