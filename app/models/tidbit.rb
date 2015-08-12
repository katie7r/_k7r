# == Schema Information
#
# Table name: tidbits
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  content        :text             not null
#  more_info      :string(255)
#  more_info_link :string(255)
#  admin_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  category       :integer          default(0), not null
#  published      :boolean          default(FALSE)
#  published_at   :datetime
#  author_name    :string(255)      default("")
#

class Tidbit < ActiveRecord::Base
  enum category: ['programming', 'zoology', 'miscellaneous']

  belongs_to :admin

  validates :category, :content, :title, presence: true
  validate :content_length_cannot_be_greater_than_100

  delegate :name, :shy_name, to: :admin, prefix: true, allow_nil: true

  #========================= Class Methods

  # Orders tidbits from most to least recently created
  def self.in_order
    order('created_at DESC')
  end

  # Gets tidbits with given category id
  def self.with_category_id(category_id)
    where(category: category_id)
  end

  # Gets tidbits with given category
  def self.with_category(category)
    with_category_id(self.categories[category])
  end

  # Gets only tidbits that are published
  def self.published
    where(published: true)
  end

  # Gets only tidbits that are unpublished
  def self.unpublished
    where(published: false)
  end

  # Returns the total count for each category (and all total)
  def self.get_totals
    totals = {}
    self.categories.each{ |name, value| totals[name] = Tidbit.with_category_id(value).size }
    totals['all'] = totals.values.inject(:+)
    return totals
  end

  # Checks if given category is in provided list
  def self.has_category?(category_name)
    self.categories.keys.include?(category_name)
  end

  #========================= Instance Methods

  # Gets the author name from author_name, admin name, or 'Anonymous'
  def author
    author_name.presence || admin_name.presence || self.class.anonymous
  end

  # Gets the integer value for the tidbit's category, based on name
  def category_id
    self.class.categories[self.category]
  end

  # Returns whether the tidbit has text for more info
  def more_info?
    more_info.present?
  end

  # Returns whether the tidbit has a link for more info
  def linked?
    more_info_link.present?
  end

  #========================= Miscellaneous

  # Fun anonymous names
  def self.anonymous
    # List of English animal names based on Wikipedia (https://en.wikipedia.org/wiki/List_of_English_animal_nouns)
    # TODO: put this somewhere else, if I decide to keep it after all
    animals = [
      'alligator', 'alpaca', 'anteater', 'antelope', 'ape', 'armadillo',
      'baboon', 'badger', 'bat', 'bear', 'beaver', 'bee', 'buffalo', 'butterfly',
      'camel', 'caribou', 'cat', 'cheetah', 'chimpanzee', 'chinchilla', 'cicada',  'clam', 'coyote', 'cricket', 'crocodile', 'crow',
      'deer', 'dinosaur', 'dog', 'dolphin', 'donkey', 'duck',
      'eel', 'elephant', 'elk',
      'ferret', 'fish', 'fox', 'frog', 'gerbil', 'giraffe', 'gnu', 'goat', 'goldfish', 'gorilla', 'grasshopper', 'guinea pig',
      'hamster', 'hare', 'hedgehog', 'herring', 'hippopotamus', 'horse', 'hyena',
      'impala',
      'jackal', 'jellyfish',
      'kangaroo',
      'leopard', 'lion', 'lizard', 'llama',
      'mallard', 'mammoth', 'manatee', 'marten', 'mink', 'minnow', 'mole', 'monkey', 'moose', 'mouse', 'mule', 'muskrat',
      'otter', 'ox', 'oyster',
      'panda', 'platypus', 'porcupine', 'porpoise', 'prairie dog', 'pug',
      'rabbit', 'raccoon', 'rat', 'raven', 'reindeer', 'rhinoceros',
      'salmon', 'sardine', 'scorpion', 'sea lion', 'seal', 'serval', 'shark', 'sheep', 'skunk', 'snail',
      'squirrel', 'tiger', 'toad', 'tortoise', 'trout', 'turtle',
      'wallaby', 'walrus', 'water buffalo', 'whale', 'wildebeest', 'wolf', 'wombat', 'woodchuck',
      'yak',
      'zebra'
    ]
    return "anonymous #{animals.sample}".titleize
  end

  private

  def content_length_cannot_be_greater_than_100 # name avoids the "100 words or [less/fewer]" issue
    if content.split(' ').size > 100
      errors.add(:content, 'cannot be longer than 100 words')
    end
  end

end
