require "spec_helper"

describe ContractsController do
  it{ get('/contracts').should route_to(controller: 'contracts', action: 'index') }
  it{ get('/contracts/3/balance').should route_to(controller: 'contracts', action: 'balance', id: '3') }
  it{ get('/contracts/3/status').should route_to(controller: 'contracts', action: 'status', id: '3') }
  it{ post('/contracts/update_contract').should route_to(controller: 'contracts', action: 'update_contract') }
  it{ post('/contracts/change_status').should route_to(controller: 'contracts', action: 'change_status') }
  it{ expect(get: '/contracts/new').not_to be_routable }
  it{ expect(get: '/contracts/1').not_to be_routable }
  it{ expect(get: '/contracts/1/edit').not_to be_routable }
  it{ expect(post: '/contracts').not_to be_routable }
  it{ expect(put: '/contracts/1').not_to be_routable }
  it{ expect(delete: '/contracts/1').not_to be_routable } 
end