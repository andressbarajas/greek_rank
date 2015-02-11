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

fraternities = Fraternity.create([
                                  { name: 'Sigma Nu', letters: 'ΣΝ'}, 
                                  { name: 'Alpha Tao Omega', letters: 'ΑΤΩ'},
                                  { name: 'Alpha Epsilon Pi', letters: 'AEΠ'}
                                ])

sororities = Sorority.create([
                              { name: 'Alpha Chi Omega', letters: 'ΑΧΩ'},
                              { name: 'Alpha Delta Pi', letters: 'ΑΔΠ'},
                              { name: 'Alpha Epsilon Phi', letters: 'ΑΕΦ'}
                            ])


sb_fraternity_chapters = FraternityChapter.create([
                                                   { chapter_name: 'Alpha', fraternity: fraternities.first},
                                                   { chapter_name: 'Alpha', fraternity: fraternities.second},
                                                   { chapter_name: 'Alpha', fraternity: fraternities.third}
                                                ])

sb_sorority_chapters = SororityChapter.create([
                                                   { chapter_name: 'Alpha', sorority: sororities.first},
                                                   { chapter_name: 'Alpha', sorority: sororities.second},
                                                   { chapter_name: 'Alpha', sorority: sororities.third}
                                                ])

la_fraternity_chapters = FraternityChapter.create([
                                                   { chapter_name: 'Beta', fraternity: fraternities.first},
                                                   { chapter_name: 'Beta', fraternity: fraternities.second},
                                                   { chapter_name: 'Beta', fraternity: fraternities.third}
                                                ])

la_sorority_chapters = SororityChapter.create([
                                                   { chapter_name: 'Beta', sorority: sororities.first},
                                                   { chapter_name: 'Beta', sorority: sororities.second},
                                                   { chapter_name: 'Beta', sorority: sororities.third}
                                                ])


University.create({name: 'University of California, Santa Barbara', 
                   initials: 'UCSB', 
                   fraternity_chapters: sb_fraternity_chapters, 
                   sorority_chapters: sb_sorority_chapters})

University.create({name: 'University of California, Los Angeles', 
                   initials: 'UCLA', 
                   fraternity_chapters: la_fraternity_chapters, 
                   sorority_chapters: la_sorority_chapters})
