require 'test_helper'

class HasEdamAnnotationsTest < ActiveSupport::TestCase
  include AuthenticatedTestHelper

  def setup
    @person = Factory(:person)
    User.current_user = @person.user
    @workflow = Factory(:workflow, contributor: @person)
  end

  def teardown
    User.current_user = nil
  end

  test 'supports edam annotations' do
    assert @workflow.supports_edam_annotations?
    refute Factory(:institution).supports_edam_annotations?
  end

  test 'annotate with label' do
    refute @workflow.edam_annotations?

    # mixture of arrays and comma separated, including an unknown one
    @workflow.edam_topics = ['Chemistry', 'Sample collections', 'Unknown']
    @workflow.edam_operations = 'Correlation, Clustering, Unknown'

    assert_difference('Annotation.count', 4) do
      assert @workflow.save
    end

    assert_equal ['http://edamontology.org/topic_3314', 'http://edamontology.org/topic_3277'], @workflow.edam_topics
    assert_equal ['http://edamontology.org/operation_3465', 'http://edamontology.org/operation_3432'],
                 @workflow.edam_operations

    assert_equal ['Chemistry', 'Sample collections'], @workflow.edam_topic_labels
    assert_equal %w[Correlation Clustering], @workflow.edam_operation_labels

    assert @workflow.edam_annotations?
  end

  test 'annotate with iri' do
    refute @workflow.edam_annotations?

    @workflow.edam_topics = ['http://edamontology.org/topic_3314', 'http://edamontology.org/topic_3277']
    @workflow.edam_operations = 'http://edamontology.org/operation_3465, http://edamontology.org/operation_3432'

    assert_difference('Annotation.count', 4) do
      assert @workflow.save
    end

    assert_equal ['http://edamontology.org/topic_3314', 'http://edamontology.org/topic_3277'], @workflow.edam_topics
    assert_equal ['http://edamontology.org/operation_3465', 'http://edamontology.org/operation_3432'],
                 @workflow.edam_operations

    assert_equal ['Chemistry', 'Sample collections'], @workflow.edam_topic_labels
    assert_equal %w[Correlation Clustering], @workflow.edam_operation_labels

    assert @workflow.edam_annotations?
  end

  test 'edam vocab present' do
    assert_equal 'edam_topics', @workflow.edam_topics_vocab.key
    assert_equal 'edam_operations', @workflow.edam_operations_vocab.key
  end
end
