import { ApolloServer } from '@apollo/server'
import { startStandaloneServer } from '@apollo/server/standalone'
import { typeDefs } from './schema.js'
import { authors, comments, posts } from './db.js'

const resolvers = {
  Query: {
    posts() {
      return posts
    },
    post(_, args, context) {
      console.log(args.id)
      return posts.find((p) => p.id === args.id)
    },
    authors() {
      return authors
    },
    comments() {
      return comments
    },
  },
  Author: {
    posts(parent) {
      return posts.filter((p) => p.author_id === parent.id)
    },
    comments(parent) {
      return comments.filter((c) => c.author_id === parent.id)
    },
  },
  Post: {
    author(parent) {
      console.log('parent :: ', parent)
      return authors.find((a) => a.id === parent.author_id)
    },
    comments(parent) {
      return comments.filter((c) => c.post_id === parent.id)
    },
  },
  Comment: {
    author(parent) {
      console.log('parent from comment s:: ', parent)
      return authors.find((c) => c.id === parent.author_id)
    },
    post(parent) {
      return posts.find((p) => p.id === parent.post_id)
    },
  },

  Mutation: {
    deleteComment(_, args) {
      return comments.filter((c) => c.id !== args.id)
    },
    addComment(_, args) {
      console.log('inputs :: ', args.comment)
      let comment = {
        ...args.comment,
        id: Math.floor(Math.random() * 1000).toString(),
      }
      return comment
    },
  },
}

// post,auth,comment
const server = new ApolloServer({
  typeDefs,
  resolvers,
})

const { url } = await startStandaloneServer(server, {
  listen: { port: 4000 },
})

console.log('SERVER RUNNIG ON PORT : ', 4000)
