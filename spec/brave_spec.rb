require "spec_helper"

describe Brave do
  it "has a version number" do
    expect(Brave::VERSION).not_to be nil
  end

  describe ".be" do
    context "without arguments" do
      context "calling a not existent method" do

        it "doesn't raise an error" do
          expect do
            Brave.be { 3.foo }
          end.not_to raise_error
        end

        it "returns nil" do
          expect(Brave.be { 3.foo }).to be nil
        end

      end

      context "calling an existent method" do
        it "returns the result of the method" do
          expect(Brave.be { -3.abs }).to eq 3
        end
      end

      context "evaluating an object" do
        it "returns an equal object" do
          expect(Brave.be { 'foo' }).to eq 'foo'
        end
      end
    end

    context "passing a list of exceptions" do
      context "evaluating a block that raises one of the passed exceptions" do
        it "returns nil" do
          class FooError < StandardError
          end
          expect(Brave.be([FooError]) do
            'hello'
            raise FooError.new
            'world'
          end).to be nil
        end
      end

      context "evaluating a block that raises an exceptio not included in the passed exceptions" do
        it "lets the exception to be raised" do
          class FooError < StandardError
          end
          class BarError < StandardError
          end
          expect do
            Brave.be([FooError]) do
              'hello'
              raise BarError.new
              'world'
            end
          end.to raise_error(BarError)
        end
      end
    end
  end

end
