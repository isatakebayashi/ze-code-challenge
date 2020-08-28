
class ZeCodeChallengeSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  # use GraphQL::Pagination::Connections

  # resolve_type ->(_type, obj, _ctx) do
  #   "Types::#{obj.class.name}Type".constantize
  # end

  rescue_from(ActiveRecord::RecordNotFound) { |e| GraphQL::ExecutionError.new e.message }
  rescue_from(ActiveRecord::RecordInvalid) { |e| GraphQL::ExecutionError.new e.message }
  # rescue_from(GraphQL::Guard::NotAuthorizedError) { |e| "No permission to access #{e.message}" }
  # rescue_from(StateMachines::InvalidTransition) { |e| GraphQL::ExecutionError.new e.message }
end
