import streamlit as st
from streamlit_chat import message
import openai


if __name__ == '__main__':
    st.set_page_config(
        page_title="Find Your Therapist",
        page_icon=":robot:"
    )

    st.header("Find Your Therapist")
    st.markdown("[Github](https://github.com/ai-yash/st-chat)")

    if 'generated' not in st.session_state:
        st.session_state['generated'] = []

    if 'messages' not in st.session_state:
        st.session_state['messages'] = [{"role": "system",
                                         "content": """You are a qualified mental health
                                         professional. You have the knowledge, training,
                                         and expertise to assess the specific needs and
                                         determine the most appropriate therapy approach for
                                         a given situation. you should choose the best 
                                         treatment for the patient only from the following: 
                                         ADD, DBT, ACT, SE, EDT, EMDR, 
                                         Anger Management, exposure therapy, mindfulness 
                                         therapy. Do not propose any other treatment! 
                                         You have to ask the patient at least 3 guiding questions
                                         before determining the best treatment for them. ask only
                                         one question at a time.
                                         Don't write more than 5 lines per question. When
                                         you are ready, give at most 2 treatment options to the
                                         patient. Be sure to give your suggestion in a separate message,
                                         not in the same message in which you ask questions. 
                                         No matter how you phrase your suggestion, include after
                                          your response a dollar sign ($) and then summarize your
                                           suggestion in exactly this format:
                                          1. treatment 1: <treatment_name>.
                                          2. treatment 2: <treatment_name>.
                                          This is the exact format of the answer and you can't deviate from it. 
                                          Don't add any text that is not in that format.
                                          You can't tell the patient that you can't help them.
                                          you must provide the patient with a treatment.""" }]

    def get_text():
        input_text = st.text_input("You: ","I need your advice.", key="input")
        return input_text


    user_input = get_text()

    if user_input:
        st.session_state['messages'].append({"role": "user", "content": user_input})

        response = openai.ChatCompletion.create(
          model="gpt-3.5-turbo",
          messages=st.session_state['messages'],
        )
        raw_response_content = response['choices'][0]['message']['content']
        response['choices'][0]['message']['content'] = raw_response_content[:raw_response_content.find("?") + 1] if "?" in raw_response_content else raw_response_content

        st.session_state['messages'].append({"role": "assistant", "content": response['choices'][0]['message']['content']})
        st.session_state['generated'].append(response['choices'][0]['message']['content'])

    if st.session_state['generated']:

        for i in range(len(st.session_state['generated'])-1, -1, -1):
            if i != 0:
                message(st.session_state["generated"][i], key=str(i))
                # message(st.session_state['messages'][i]['content'], is_user=True, key=f"user {i}")
                message(st.session_state['messages'][i]['content'], is_user=st.session_state['messages'][i]['role'] == 'user', key=str(i) + '_user')
