document.getElementById('testButton').addEventListener('click', function() {
    fetch('https://ricis_dev_server/test', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ message: 'Button clicked!' })
    });
});

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'showNotification') {
        alert(data.message);
    }
});
