import { useState, useEffect } from 'react';

function App() {
  const [count, setCount] = useState(0);
  const [buttonColor, setButtonColor] = useState('bg-white');

  function increment() {
    setCount(count + 1);
  }

  useEffect(() => {
    if (count >= 25) {
      setButtonColor('bg-pink-600');
    } else if (count >= 20) {
      setButtonColor('bg-green-500');
    } else if (count >= 15) {
      setButtonColor('bg-blue-500');
    } else if (count >= 10) {
      setButtonColor('bg-purple-500');
    } else if (count >= 5) {
      setButtonColor('bg-red-500');
    } else setButtonColor('bg-white');
    console.log(count);
  }, [count]);

  return (
    <div className="flex min-h-screen items-center justify-center bg-pink-200">
      <button
        onClick={increment}
        className={`${buttonColor} w-40 rounded-full px-12 py-4 text-4xl
        font-extrabold shadow-md transition-colors duration-300
        active:translate-y-1 active:shadow-none`}>
        {count}
      </button>
    </div>
  );
}

export default App;
