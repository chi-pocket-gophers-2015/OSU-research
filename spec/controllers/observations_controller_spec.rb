require 'rails_helper'

RSpec.describe ObservationsController, :type => :controller do

	let!(:experiment) { Experiment.create!(title: 'This Experiment', procedure: 'This Procedure', results: 'These Results', conclusion: 'This conclusion', active: true) }
	let!(:observation) {Observation.create!(experiment_id: experiment.id, body: "Hello!")}

	describe "GET #new" do
		it "assigns a new observation instance as @observation to an experiment" do			
			get :new, {experiment_id: experiment.id}
	  	expect(assigns(:observation)).to be_an_instance_of(Observation)
		end
	end

	describe "DELETE #destroy" do
		it "deletes observation at @observation" do
			expect { delete :destroy , experiment_id: experiment.id, id: observation.id}.to change(Observation, :count).by(-1)
		end
		it "re-directs to the experiment page" do
			delete :destroy, {experiment_id: experiment.id, id: observation.id}
			expect(response).to redirect_to(experiment_path(assigns(:experiment)))
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			let(:good_params) {{experiment_id: 1, body: "This here"}}
			it "creates a new observation" do
        expect { post :create, experiment_id: experiment.id, observation: good_params}.to change(Observation, :count).by(1)
			end

			it "re-directs to the experiment page" do
				post :create, {experiment_id: experiment.id, observation: good_params}
				expect(response).to redirect_to(experiment_path(assigns(:experiment)))
			end		
		end

		context "when invalid params are passed" do
			let(:bad_params) {{experiment_id: 1}}
			it "re-renders the 'new' template" do
				# binding.pry
				post :create, {experiment_id: experiment.id, observation: bad_params}
				expect(response).to render_template(:new)
			end
		end
	end
end
