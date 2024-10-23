const handleChat = () => {
    userMessage = chatInput.value.trim();
    if (!userMessage) return;

    chatInput.style.height = `${inputInitHeight}px`;
    chatbox.appendChild(createChatLi(userMessage, "outgoing"));
    chatbox.scrollTo(0, chatbox.scrollHeight);

    setTimeout(() => {
        const incomingChatLi = createChatLi("Thinking...", "incoming");
        chatbox.appendChild(incomingChatLi);
        chatbox.scrollTo(0, chatbox.scrollHeight);

        // G?i yêu c?u t?i backend
        fetch('/sendMessage', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'message': userMessage
            })
        })
        .then(response => response.json())
        .then(data => {
            incomingChatLi.querySelector("p").textContent = data.choices[0].message.content.trim();
        })
        .catch(error => {
            incomingChatLi.querySelector("p").textContent = "An error occurred!";
            console.error(error);
        });
    }, 600);
}
