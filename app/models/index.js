const List = require('./list');
const Card = require('./card');
const Tag = require('./tag');

// Associations

// One List can have Many Cards
List.hasMany(Card, {
    as: 'cardsList',
    foreignKey: 'list_id'
});

//  One Card belongs to One List
Card.belongsTo(List, {
    as: 'list',
    foreignKey: 'list_id'
});

//  One Card belongs to Many Tags
Card.belongsToMany(Tag, {
    as: 'tagsList',
    // We gave the name of the table in our DB
    through: 'card_has_tag', 
    foreignKey: 'card_id',
    otherKey: 'tag_id'
});

//  One Tag belongs to Many Cards
Tag.belongsToMany(Card, {
    as: 'cardsList',
    // We gave the name of the table in our DB
    through: 'card_has_tag',
    foreignKey: 'tag_id',
    otherKey: 'card_id'
});

module.exports = { List, Card, Tag };