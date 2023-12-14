export const typeDefs = `#graphql
type Post {
    id : ID!,
    title : String! ,
    tags :[String!]!, # the array can not be null and the value inside either 
    description : String!
    author : Author! 
    comments : [Comment!]   
}

type Author {
    id : ID!,
    username : String!,
    email : String!
    comments : [Comment!],
    posts : [Post!]
}

type Comment {
    id : ID!,
    text : String!,
    date : String!
    author : Author! 
    post: Post!
}

type Query {
    posts : [Post]
    post(id : ID!) : Post
    authors : [Author]
    author : Author
    comments : [Comment]
}

type Mutation{
    deleteComment(id :ID) : [Comment]
    addComment(comment : IComment ) : Comment
}
 
input IComment{
    text : String!,
    date : String!
    author_id : ID
    post_id: ID
}

`

// int,float,string,boolean,ID,
